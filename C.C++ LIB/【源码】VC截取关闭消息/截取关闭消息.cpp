#include <windows.h>
#include <stdio.h>       //可以删掉，只是下面有提示语句

typedef HWND (WINAPI *PROCGETCONSOLEWINDOW)();
PROCGETCONSOLEWINDOW GetConsoleWindow;
HHOOK hHook;

DWORD HookProc(int nCode,WPARAM wParam,LPARAM lParam)
{
 if(nCode>=0&&wParam==WM_LBUTTONDOWN)
 {
  DWORD pt[2];
  memcpy(&pt[0],(void*)lParam,8);
  if(SendMessage(GetConsoleWindow(),WM_NCHITTEST,0,(LPARAM)pt[0]+0x10000*pt[1])==HTCLOSE)
  {
   PostThreadMessage(GetCurrentThreadId(),WM_USER+1,0,0);
   return 1;
  }
 }
 return CallNextHookEx(hHook,nCode,wParam,lParam);
}
int main(int argc, char* argv[])
{
 HMODULE hKernel32=GetModuleHandle("kernel32");
 GetConsoleWindow=(PROCGETCONSOLEWINDOW)GetProcAddress(hKernel32,"GetConsoleWindow");
 hHook=SetWindowsHookEx(14,(HOOKPROC)HookProc,NULL,NULL);
 MSG msg;
 printf("准备工作完成!\n");
 while(GetMessage(&msg,NULL,0,0))
 {
  if(msg.message==WM_USER+1)
  {
   if(MessageBox(NULL,"QUIT?","Console",MB_YESNO)==IDYES) SendMessage(GetConsoleWindow(),WM_CLOSE,NULL,NULL);
  }
 }
 UnhookWindowsHookEx(hHook);
 return 0;
}