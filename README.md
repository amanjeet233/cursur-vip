# Cursor Free VIP

<div align="center">
  <img src="./images/logo.png" alt="Cursor Pro Logo" width="200" style="border-radius: 6px;"/>
</div>

## 📋 Description

Cursor Free VIP is a tool that helps bypass Cursor Pro limitations by registering accounts with custom emails and managing Cursor's configuration. It supports Google and GitHub account registrations, temporary email services, and can reset Cursor data and hardware information.

**Supported Platforms:** Windows, macOS, Linux

## 🚀 Quick Start

### Prerequisites
- Python 3.7 or higher
- Google Chrome browser
- Administrator privileges (recommended)

### Installation

**Option 1: Automatic Installation (Recommended)**

**Windows:**
```powershell
irm https://raw.githubusercontent.com/amanjeet233/cursur-vip/master/scripts/install_new.ps1 | iex
```

**Linux/macOS:**
```bash
curl -fsSL https://raw.githubusercontent.com/amanjeet233/cursur-vip/main/scripts/install.sh -o install.sh && chmod +x install.sh && ./install.sh
```

**Option 2: Manual Installation**

1. Clone the repository:
```bash
git clone https://github.com/amanjeet233/cursur-vip.git
cd cursur-vip
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Run the application:
```bash
python main.py
```

### Manual Reset (Alternative)

**Windows:**
```powershell
irm https://raw.githubusercontent.com/amanjeet233/cursur-vip/main/scripts/reset.ps1 | iex
```

**Linux/macOS:**
```bash
curl -fsSL https://raw.githubusercontent.com/amanjeet233/cursur-vip/main/scripts/reset.sh | sudo bash
```

## ✨ Features

- Google OAuth Authentication with Lifetime Access
- GitHub OAuth Authentication with Lifetime Access
- Automatic Cursor account registration
- Support for Windows, macOS, and Linux
- Complete authentication verification
- Cursor configuration reset
- Delete Cursor Google Account
- Multi-language support (English, Chinese, Vietnamese)
- Temporary email service integration

## ⚙️ Configuration

The configuration file is located at:
- **Windows:** `C:\Users\[username]\Documents\.cursor-free-vip\config.ini`
- **macOS:** `~/Documents/.cursor-free-vip/config.ini`
- **Linux:** `~/Documents/.cursor-free-vip/config.ini`

### Basic Configuration
```ini
[Chrome]
chromepath = C:\Program Files\Google\Chrome\Application\chrome.exe

[Turnstile]
handle_turnstile_time = 2
handle_turnstile_random_time = 1-3

[Timing]
min_random_time = 0.1
max_random_time = 0.8
page_load_wait = 0.1-0.8
input_wait = 0.3-0.8
submit_wait = 0.5-1.5
```

## 🛠️ Usage

1. Run the application with administrator privileges
2. Select your preferred option from the menu
3. Follow the on-screen instructions
4. The tool will handle account registration and configuration automatically

### Available Options:
- Register with Google Account (Lifetime Access)
- Register with GitHub Account (Lifetime Access)
- Register with Custom Email
- Temporary GitHub Registration
- Reset Machine ID
- Disable Auto-Update
- Show Configuration
- Change Language

## ⚠️ Important Notes

- **Run with administrator privileges** for best results
- **Close Cursor application** before running the script
- **Clean browser cache and cookies** before use
- **Use VPN** when creating new accounts (recommended)
- This tool is for educational and research purposes only
- Comply with Cursor's terms of service

## 🐛 Troubleshooting

### Common Issues:
- **Permission errors:** Run with administrator privileges
- **"User is not authorized":** Your account was banned for using temporary email
- **Chrome not found:** Install Google Chrome or update the path in config.ini
- **Update check fails:** This is normal if no releases exist yet

### Getting Help:
- Check the [Issues](https://github.com/amanjeet233/cursur-vip/issues) page
- Create a new issue if you encounter problems

## 📝 License

This project uses the [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/) license.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## 📞 Contact

- **Repository:** [amanjeet233/cursur-vip](https://github.com/amanjeet233/cursur-vip)
- **Original Project:** [yeongpin/cursor-free-vip](https://github.com/yeongpin/cursor-free-vip)

---

**Disclaimer:** This tool is for educational and research purposes only. Any consequences from using this tool are the user's responsibility.
