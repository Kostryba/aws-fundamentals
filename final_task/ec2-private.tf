resource "aws_instance" "ec2-private" {
  ami                    = var.image_id
  instance_type          = var.ec2_instance_type
  availability_zone      = var.private1_availability_zone
  subnet_id              = aws_subnet.final-subnet1-private.id
  vpc_security_group_ids = [aws_security_group.private-security-group.id]
  iam_instance_profile   = aws_iam_instance_profile.final_ec2_profile.name
  key_name               = "okostryba_lohika_ssh"
  user_data              = <<EOF
  		#! /bin/bash
        sudo su
        wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.rpm
        sudo yum install -y jdk-8u141-linux-x64.rpm
        aws s3api get-object --bucket final-kostryba-bucket --key persist3-2021-0.0.1-SNAPSHOT.jar persist3-2021-0.0.1-SNAPSHOT.jar
        export RDS_HOST=${aws_db_instance.final_rds_db.endpoint}
        java -jar persist3-2021-0.0.1-SNAPSHOT.jar
  	EOF

  tags = {
    Name = "ec2-private"
  }
}

