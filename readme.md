
# 🌐 Google Cloud Static Website with Terraform

A beginner-friendly, low-cost static website hosting project using Google Cloud Platform and Terraform.

> 🚀 **Work in progress** - Continuously improving Google Cloud skills through hands-on projects!

[![My Skills](https://skillicons.dev/icons?i=gcp,terraform,html,css&perline=4)](https://skillicons.dev)

## 📋 What This Project Does

- **Hosts a static website** on Google Cloud Storage
- **Global CDN distribution** via Cloud Load Balancer
- **HTTPS support** with managed SSL certificates
- **Infrastructure as Code** using Terraform
- **Cost-effective**: ~$0.01-$0.50 per month

## 🚀 Quick Start

### Prerequisites
- Google Cloud Platform account
- [Terraform](https://www.terraform.io/downloads) installed
- [gcloud CLI](https://cloud.google.com/sdk/docs/install) installed and authenticated

### Setup Steps

1. **Clone and navigate to the project**
   ```bash
   git clone <your-repo-url>
   cd google-cloud-practice
   ```

2. **Set up your Google Cloud project**
   ```bash
   # Create a new project (optional)
   gcloud projects create your-unique-project-id
   
   # Set the project
   gcloud config set project your-unique-project-id
   
   # Enable required APIs
   gcloud services enable storage.googleapis.com compute.googleapis.com
   ```

3. **Configure Terraform variables**
   ```bash
   # Copy the example file
   cp terraform.tfvars.example terraform.tfvars
   
   # Edit terraform.tfvars with your values
   # Replace 'your-gcp-project-id-here' with your actual project ID
   ```

4. **Deploy the infrastructure**
   ```bash
   # Initialize Terraform
   terraform init
   
   # Plan the deployment
   terraform plan
   
   # Apply the changes
   terraform apply
   ```

5. **Access your website**
   - The website URL will be shown in the Terraform outputs
   - It may take a few minutes for DNS and SSL to propagate

## 💰 Cost Breakdown

| Service | Monthly Cost (estimate) |
|---------|------------------------|
| Cloud Storage | $0.01 - $0.05 |
| Cloud CDN | $0.00 - $0.20 |
| Load Balancer | $0.00 - $0.25 |
| **Total** | **~$0.01 - $0.50** |

*Note: Costs depend on traffic. Most beginner projects stay within free tier limits.*

## 🔒 Security & Best Practices

- ✅ Secrets are kept in `terraform.tfvars` (git-ignored)
- ✅ Uses managed SSL certificates
- ✅ Follows least-privilege access patterns
- ✅ Enables uniform bucket-level access

## 🛠️ Customization

- **Website content**: Edit files in the `website/` directory
- **Domain name**: Update `domain_name` in `terraform.tfvars`
- **Region**: Change `region` variable for different locations
- **Styling**: Modify the CSS in `index.html`

## 🧹 Cleanup

To avoid ongoing charges, destroy the resources when done:

```bash
terraform destroy
```

## 📚 Learning Objectives

This project teaches:
- ✅ Terraform basics and state management
- ✅ Google Cloud Storage for web hosting  
- ✅ Cloud CDN and global distribution
- ✅ SSL certificate management
- ✅ Infrastructure as Code best practices
- ✅ Secret management in version control

## 🔗 Next Steps

- Add a custom domain
- Implement CI/CD with GitHub Actions
- Add monitoring and alerting
- Integrate with Cloud Functions for dynamic content

---

Happy Coding! 🚀

<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=gcp,terraform,git" />
  </a>
</p>

*Last updated: February 2026*
