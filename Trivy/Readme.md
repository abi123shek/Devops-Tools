# Overview
Trivy is an open-source security scanning tool designed to identify vulnerabilities in container images, file systems, and Git repositories. It is lightweight and easy to use, making it ideal for developers looking to integrate security into their CI/CD pipelines. Trivy stands out for its fast and accurate scanning capabilities, supporting multiple vulnerability databases, including those for operating systems, programming languages, and container images.

# Key Features:

* Vulnerability Scanning for Containers: Trivy scans container images to detect known vulnerabilities in the operating system packages and application dependencies, such as those listed in Common Vulnerabilities and Exposures (CVE).
  
* Support for Multiple Sources: Trivy can scan various types of sources, including:
** Container Images: Detects vulnerabilities in Docker or container images.
** File Systems: Can scan local file systems and directories.
** Git Repositories: Scans dependencies within Git repositories.

* Fast and Efficient: Trivy operates quickly because it uses a lightweight and minimalistic approach, fetching only necessary metadata to perform scans.

* Multi-Layer Vulnerability Detection: It identifies vulnerabilities not just in the operating system but also in application dependencies (e.g., in language-specific libraries such as Python, Ruby, Node.js).



# Basic Commands:

* Scan a container image: ```bash trivy image <image_name> ```
* Scan a directory or file system : ``` trivy fs <directory_path> ```
* Scan a Git repository: ``` trivy repo <repository_url> ```
