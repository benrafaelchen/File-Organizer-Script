# 🗂️ File Organizer Bash Script

This interactive Bash script helps you organize files in any directory based on their file extensions.  
It's flexible, customizable, and keeps your workspace clean!

---

## ✨ Features

- 📁 Organize files into subfolders by extension (`.jpg` → `jpg/`, `.pdf` → `pdf/`)
- 🚫 Optionally exclude specific file types (e.g., skip `.txt`, `.mp4`)
- 📍 Choose a different destination directory
- 📝 Generates a detailed log file: `file_organizer.log`
- 🔢 Displays a summary of files organized by type
- 🧼 Skips hidden files and folders safely

---

## 📦 Example

**Before:**

```
MyFolder/
├── image1.jpg
├── video1.mp4
├── document1.pdf
```

**After running the script:**

```
MyFolder/
├── jpg/
│   └── image1.jpg
├── mp4/
│   └── video1.mp4
├── pdf/
│   └── document1.pdf
├── file_organizer.log
```

---

## 🚀 How to Use

### 1. Clone the repository:
```
git clone https://github.com/benrafaelchen/File-Organizer-Script.git
cd File-Organizer-Script
```

### 2. Make the script executable:
```
chmod +x file_organizer.sh
```

### 3. Run the script:
```
./file_organizer.sh
```

The script will ask:
- Which directory to organize  
- Whether to exclude specific file types  
- Whether to use a different destination folder  

---

## 📄 Log File

A log is saved to `file_organizer.log` inside the destination directory.  
It includes a list of all moved files and a summary by extension.

---

## ⚠️ Notes

- The script only affects **visible, non-directory files** in the specified folder.
- It **moves** files — not copies — so use with care.
- You can modify how folder names are generated (currently by extension).

---

✅ Lightweight. Interactive. Useful.
