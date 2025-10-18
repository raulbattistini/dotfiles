function Toggle-TerminalFocus {
    Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class Win32 {
        [DllImport("user32.dll")] public static extern IntPtr GetForegroundWindow();
        [DllImport("user32.dll")] public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
        [DllImport("user32.dll")] public static extern bool IsZoomed(IntPtr hWnd); // Check if maximized
    }
"@

    $hwnd = [Win32]::GetForegroundWindow()

    if ([Win32]::IsZoomed($hwnd)) {
        # 9 = SW_RESTORE
        [Win32]::ShowWindow($hwnd, 9)
    } else {
        # 3 = SW_MAXIMIZE
        [Win32]::ShowWindow($hwnd, 3)
    }
}
Toggle-TerminalFocus
