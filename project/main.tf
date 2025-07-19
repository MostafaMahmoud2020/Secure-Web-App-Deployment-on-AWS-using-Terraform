module "vpc" {
    source = "./modules/network/vpc"
}

module "subnets" {
    source = "./modules/network/subnet"
    vpc_id = module.vpc.vpc_id
}

module "igw" {
    source = "./modules/network/internetGateway"
    vpc_id = module.vpc.vpc_id
}

module "nat" {
    source = "./modules/network/natGateway"
    public_subnet_id_1 =  module.subnets.public_subnet_id_1
    public_subnet_id_2 =  module.subnets.public_subnet_id_2
}

module "routeTable" {
    source = "./modules/network/routeTable"
    vpc_id = module.vpc.vpc_id
    nat_gateway_id_1 = module.nat.nat_id_1
    nat_gateway_id_2 = module.nat.nat_id_2
    igw_id = module.igw.igw_id
}

module "igwAttachment" {

    source = "./modules/network/igwAttachment"
    route_table_private_id_1 = module.routeTable.route_table_nat_id_1
    route_table_private_id_2 = module.routeTable.route_table_nat_id_2
    route_table_public_id = module.routeTable.route_table_public_id
    public1_subnet_id = module.subnets.public_subnet_id_1
    public2_subnet_id = module.subnets.public_subnet_id_2
    private1_subnet_id = module.subnets.private_subnet_id_1
    private2_subnet_id = module.subnets.private_subnet_id_2
}


module "proxySG" {
    source = "./modules/secuirtyGroup/proxy"
    vpc_id = module.vpc.vpc_id
}

module "be_ws_sg" {
    source = "./modules/secuirtyGroup/BEWS"
    vpc_id = module.vpc.vpc_id
    proxy_sg_id = module.proxySG.proxy_sg_id  
    
}


module "instance1-public" {
    source = "./modules/instances/public_instances/az1/instance1"
    public_subnet_id = module.subnets.public_subnet_id_1
    internal_alb_dns_name = module.alb_internal.internal_alb_dns_name
    sg = module.proxySG.proxy_sg_id
}

module "instance2-public" {
  source = "./modules/instances/public_instances/az2/instance2"
  public_subnet_id = module.subnets.public_subnet_id_2
   internal_alb_dns_name = module.alb_internal.internal_alb_dns_name
  sg = module.proxySG.proxy_sg_id
}


module "instance1-private" {
    source = "./modules/instances/private_instances/az1/instance1"
    private_subnet_id = module.subnets.private_subnet_id_1
    sg = module.be_ws_sg.be_ws_sg_id
  
}

module "instance2-private" {
    source = "./modules/instances/private_instances/az2/instance2"
    private_subnet_id = module.subnets.private_subnet_id_2
    sg = module.be_ws_sg.be_ws_sg_id
  
}

module "alb_sg" {
    source = "./modules/secuirtyGroup/alb_allowHTTP"
    vpc_id = module.vpc.vpc_id
    
}


module "public_alb" {
    source = "./modules/LoadBalancer/publicALB"
    sg = module.alb_sg.public_alb_id
    subnets = [module.subnets.public_subnet_id_1, module.subnets.public_subnet_id_2]
    vpc_id = module.vpc.vpc_id
}


module "alb_internal_sg" {
    source = "./modules/secuirtyGroup/alb_internal"
    vpc_id = module.vpc.vpc_id
    cidr_block = module.vpc.cidr_block
}


module "alb_internal" {
    source = "./modules/LoadBalancer/internalALB"
    sg = module.alb_internal_sg.internal_alb_id
    subnets = [module.subnets.private_subnet_id_1, module.subnets.private_subnet_id_2]
    vpc_id = module.vpc.vpc_id
  
}

module "alb_attach_public" {
    source = "./modules/LoadBalancer/albAttachment/publicALB"
    frontend_target_group_arn = module.public_alb.target_group_arn
    frontend_instance1_id = module.instance1-public.instance1_id
    frontend_instance2_id = module.instance2-public.instance2_id
}

module "alb_attach_internal" {
    source = "./modules/LoadBalancer/albAttachment/internalALB"
    backend_target_group_arn = module.alb_internal.target_group_arn 
    backend_instance1_id = module.instance1-private.instance1_id
    backend_instance2_id = module.instance2-private.instance2_id
  
}   

