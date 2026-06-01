# ✈️ Aviation Knowledge Test System

An immersive, premium digital examination platform engineered for **Flight Ground Instruction**. This system features a responsive frontend styled after modern glass-cockpit flight displays (HUD) and utilizes a secure Google Apps Script backend integrated directly with Google Sheets for question banking, logging, and evaluation metrics.

---

## 🚀 Key Features

* **Dual Display Configurations:** Supports hot-swapping between **Night Ops Mode** (Dark Glass Cockpit theme) and **Day VFR Mode** (High-visibility light theme).
* **Dynamic Electronic Flight Instrument Display:** Includes automated countdown timers, progress tracks, and real-time step locking.
* **Decoupled Architecture:** Features a standalone `index.html` frontend that interacts seamlessly with the backend via secure asymmetric `POST` fetch hooks.
* **Robust Backend Evaluation Engine:** Implements question randomization, automatic grading matrix conversions, performance logs, and spreadsheet synchronization via Google Apps Script (`Code.gs`).
* **Interactive Visual Attachments:** Supports inline aviation chart images and diagrams fetched dynamically per question.

---

## 🛠️ System Architecture
---

## 📊 Google Sheets Setup Requirement

The backend script expects a specific spreadsheet schema. Ensure your active spreadsheet contains the following four sheets:

### 1. `Questions`
This sheet serves as your central database for test materials. It must contain headers including exactly:
* **Column A (`id`)**: Unique question identifier number.
* **Column B (`text`)**: The text of the question.
* **Column C (`A`)**: Option A choice.
* **Column D (`B`)**: Option B choice.
* **Column E (`C`)**: Option C choice.
* **`question_image_url`**: (Named header) URL link to an aviation chart, section graphic, or diagram.
* **`Correct_Answer`**: (Named header) Target character option (`A`, `B`, or `C`).

### 2. `Exam_Results`
Stores submitted pilot certification grades. Columns appended automatically:
`Timestamp` | `Student ID` | `Student Name` | `Raw Score` | `Percentage` | `Time Spent` | `Status`

### 3. `Students`
Roster tracking space for authorized student credentials.

### 4. `Logs`
Maintains operational telemetry loops:
`Timestamp` | `Event Type` | `Details Log`

---

## 🔧 Installation & Deployment Guide

### Phase 1: Deploying the Backend (`Code.gs`)
1. Create a new [Google Sheet](https://sheets.new) and format the sheets based on the schema above.
2. Copy the spreadsheet's unique ID from the URL:
   `https://docs.google.com/spreadsheets/d/YOUR_SPREADSHEET_ID/edit`
3. Open **Extensions** > **Apps Script**.
4. Replace all code in `Code.gs` with your script code.
5. Update your `CONFIG.SHEET_ID` property at the top of the file:
   ```javascript
   SHEET_ID: 'YOUR_SPREADSHEET_ID',