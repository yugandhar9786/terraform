
# 🛠️ Terraform Installation Guide

This guide provides step-by-step instructions for installing **Terraform** on macOS, Linux (Ubuntu/Debian), and Windows.

---

## 📌 Prerequisites
- Internet connection  
- Admin or sudo access  
- Basic terminal/command prompt knowledge  

---

## 📥 Installation Steps

---

## **🔵 macOS Installation**

### **Using Homebrew (Recommended)**

```bash
brew install hashicorp/tap/terraform
```

### **Enable Autocomplete**
```bash
terraform -install-autocomplete
```

### **Check Version**
```bash
terraform -version
```

### **Fix Common Error**
If you see:

```
Error: No developer tools installed.
```

Install Xcode Command Line Tools:
```bash
xcode-select --install
```

---

## **🟢 Ubuntu / Debian Installation**

### **Step 1: Add HashiCorp GPG Key**
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

### **Step 2: Add HashiCorp Repo**
```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```

### **Step 3: Update and Install Terraform**
```bash
sudo apt update && sudo apt install terraform
```

### **Enable Autocomplete**
```bash
terraform -install-autocomplete
```

### **Check Version**
```bash
terraform -version
```

---

## **🟣 Windows Installation**

### **Step 1: Download Terraform**

Download from the official website:  
https://developer.hashicorp.com/terraform/install

### **Step 2: Extract Zip File**
- Extract `.zip` file  
- Move `terraform.exe` to a folder like `C:\terraform`

### **Step 3: Add Terraform to PATH**
1. Open *Environment Variables*  
2. Edit *Path*  
3. Add folder path with `terraform.exe`

### **Step 4: Verify Installation**
```powershell
terraform -version
```

---

## ⚙️ Optional Setup

### **Alias Shortcut (Linux/macOS)**

```bash
alias tf=terraform
```

Make it permanent:
```bash
echo "alias tf=terraform" >> ~/.bashrc
```

Or for zsh:
```bash
echo "alias tf=terraform" >> ~/.zshrc
```

---

## 🎯 Installation Complete!

Run this to explore more commands:
```bash
terraform --help
```
