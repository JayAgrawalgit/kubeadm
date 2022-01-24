module "base_st" {
  source = "./modules/aws_st"
  az-a = "ap-south-1a"
  az-b = "ap-south-1b"
}

#ec2-worker
resource "aws_instance" "ec2-worker" {
  ami           = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"
  subnet_id     = module.base_st.worker-sub-id
  count         = 2
  tags = {
    "Name" = "worker-${count.index + 1}"
  }
}


#ec2-master
resource "aws_instance" "ec2" {
  ami           = "ami-052cef05d01020f1d"
  instance_type = "t2.medium"
  subnet_id     = module.base_st.master-sub-id
  tags = {
    "Name" = "master"
  }
}
