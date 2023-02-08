provider "google" {
  project = "salma-youssef-project"
  region  = "us-east1"
  zone    = "us-east1-b"
}

module "sa"{
    source = "./service_account"
    account_id = "gke-vm-sa"
    project_id = "salma-youssef-project"
    roles = {
       "role1" = "roles/container.admin",
        "role2" = "roles/compute.admin",
    }
    sa_member = ["serviceAccount:${module.sa.sa-email}"]
    sa_name = module.sa.sa-name

    key = module.sa.decoded_private_key
    path="../"

}

module "vpc"{
    source = "./vpc"
    vpc-name = "my-vpc"
    vpc-project = "salma-youssef-project"
    vpc-mode = false
}

module "subnet"{
    source = "./subnet"

    subnet-network = module.vpc.vpc-name
   // project = "salma-youssef-project"
    
    //management subnet
    manag-subnet-name =  "management-subnet"
    manag-subnet-cidr = "10.0.0.0/24"
    manag-subnet-region = "us-east1"
    
    //restricted subnet
    restricted-subnet-name = "restricted-subnet"
    restricted-subnet-cidr = "10.0.1.0/24"
    restricted-subnet-region = "us-east4"

}

module "vm"{
    source = "./vm"

    vm_name = "private-vm"
    vm_type = "f1-micro" 
    vm_zone = "us-east1-b"
    vm_tags = ["private-vm"]
    vm_image = "debian-cloud/debian-11"
    vm_network = module.vpc.vpc-name
    vm_subnet = module.subnet.manag_subnet_name
    vm_sa = module.sa.sa-email
    vm_scopes = ["cloud-platform"]
}

module "nat"{
    source = "./nat_gateway"

    router_name = "nat-router"
    router_region = module.subnet.manag_region_name
    router_network = module.vpc.vpc-id

    nat_name = "my-nat"
    nat_router = module.nat.router_name
    nat_region = module.nat.router_region
    ip_allocation = "AUTO_ONLY"
    source_subnetwork = "ALL_SUBNETWORKS_ALL_IP_RANGES"
    
}