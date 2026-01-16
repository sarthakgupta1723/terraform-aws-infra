resource "aws_instance" "this" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name = var.key_name
  tags = var.tags
}

resource "aws_ebs_volume" "data" {
  count = length(var.data_disks)
  availability_zone = var.availability_zone
  size = var.data_disks[count.index].size
  type = var.data_disks[count.index].type
}

resource "aws_volume_attachment" "attach" {
  count = length(var.data_disks)
  device_name = "/dev/xvd${count.index + 1}"
  volume_id = aws_ebs_volume.data[count.index].id
  instance_id = aws_instance.this.id
}
