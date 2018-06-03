resource "aws_alb_target_group" "internal_target_group" {
    name = "internal-target-group"
    port = 80
    protocol = "HTTP"
    vpc_id = "${aws_vpc.demo_vpc_terraform.id}"
    health_check {
        healthy_threshold = 5
        unhealthy_threshold = 2
        timeout = 5
    }
}

resource "aws_alb_target_group_attachment" "internal_target" {
    target_group_arn = "${aws_alb_target_group.internal_target_group.arn}"
    target_id        = "${aws_instance.demo_backend_terraform.id}"
}