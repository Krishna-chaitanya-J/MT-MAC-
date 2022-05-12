locals {
  demo-node-userdata = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.eks-cluster.endpoint}' --b64-cluster-ca '${aws_eks_cluster.eks-cluster.certificate_authority.0.data}' 'eks-${var.app}'
USERDATA
}

resource "aws_launch_configuration" "workernode" {
  associate_public_ip_address = false
  iam_instance_profile        = "${aws_iam_instance_profile.eks-instance-profile.name}"
  image_id                    = "${var.ami_id}"
  instance_type               = "${var.instanceType}"
  security_groups             = ["${}"]
  user_data_base64            = "${base64encode(local.node-userdata)}"
  key_name                    = "${var.KeyPair}"

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_group" "eks-asg" {
  desired_capacity     = "${}"
  launch_configuration = "${aws_launch_configuration.workernode.id}"
  health_check_grace_period = 200
  max_size             = "${}"
  min_size             = "${}"
  name                 = "eks-autoscale-${var.app}"
  vpc_zone_identifier  = ["${}", "${}"]

tag {
    key                 = "NAME"
    value               = "${var.app}-node"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.app}-eks"
    value               = "owned"
    propagate_at_launch = true
  }
}