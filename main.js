import { invoke } from '@tauri-apps/api/core';

const MPIDC_URL = 'https://mpidc-invoice-system.vercel.app/login';
const loading = document.getElementById('loading');
const error = document.getElementById('error');
const webviewFrame = document.getElementById('webview-frame');
const retryBtn = document.getElementById('retryBtn');

async function checkInternetAndLoad() {
  try {
    // Show loading state
    loading.style.display = 'block';
    error.style.display = 'none';
    webviewFrame.classList.remove('visible');

    // Check internet connectivity using Tauri backend
    const isOnline = await invoke('check_internet_connection');

    if (isOnline) {
      // Internet is available, load the webview
      loading.style.display = 'none';
      webviewFrame.src = MPIDC_URL;
      webviewFrame.classList.add('visible');
    } else {
      // No internet connection
      showError();
    }
  } catch (err) {
    console.error('Error checking internet:', err);
    showError();
  }
}

function showError() {
  loading.style.display = 'none';
  error.style.display = 'block';
  webviewFrame.classList.remove('visible');
}

// Retry button handler
retryBtn.addEventListener('click', () => {
  checkInternetAndLoad();
});

// Initial check on app load
checkInternetAndLoad();

