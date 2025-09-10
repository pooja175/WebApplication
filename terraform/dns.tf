# Use DigitalOcean domain resource. This will create domain zone on DO.
resource "digitalocean_domain" "domain" {
  name = var.domain
}

# We'll create an A record placeholder; you may need to update to LB IP after ingress load balancer provisioned.
# To create record pointing to the cluster load balancer IP you'll need to run `kubectl get svc -n ingress-nginx` and update this record.
resource "digitalocean_record" "www" {
  domain = digitalocean_domain.domain.name
  type   = "A"
  name   = "@"
  value  = "127.0.0.1" # placeholder — update once LB IP is known or use Terraform external data source to fetch it.
}
