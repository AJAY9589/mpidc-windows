// Prevents additional console window on Windows in release builds
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use tauri::Manager;

#[tauri::command]
fn check_internet_connection() -> bool {
    // Try to connect to a reliable endpoint
    let urls = vec![
        "https://www.google.com",
        "https://www.cloudflare.com",
        "https://mpidc-invoice-system.vercel.app",
    ];

    for url in urls {
        match reqwest::blocking::get(url) {
            Ok(response) => {
                if response.status().is_success() {
                    return true;
                }
            }
            Err(_) => continue,
        }
    }

    false
}

fn main() {
    tauri::Builder::default()
        .plugin(tauri_plugin_shell::init())
        .invoke_handler(tauri::generate_handler![check_internet_connection])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}

