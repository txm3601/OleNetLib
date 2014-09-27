#ifndef __FILEINIDLL_H__
#define __FILEINIDLL_H__


#ifdef __cplusplus
	#define CA_EXTERN_C extern "C"
#else
    #define CA_EXTERN_C
#endif //__cplusplus


#ifdef XFILEINIDLL_EXPORTS
	#define SDK_XFILEINIDLL(rettype) CA_EXTERN_C __declspec(dllexport) rettype __stdcall
#else
	#define SDK_XFILEINIDLL(rettype) CA_EXTERN_C __declspec(dllimport) rettype __stdcall
#endif //XFILEINIDLL_EXPORTS


SDK_XFILEINIDLL(void) SetINIFileName( const char* INIFileName );
SDK_XFILEINIDLL(void) GetString( const char* Section, const char* KeyName, char* ReturnStr );
SDK_XFILEINIDLL(void) GetInt( const char* Section, const char* KeyName, int* ReturnValue );
SDK_XFILEINIDLL(void) GetFloat( const char* Section, const char* KeyName, float* ReturnValue );
SDK_XFILEINIDLL(int) SetString( const char* Section, const char* KeyName, const char* InputStr );
SDK_XFILEINIDLL(int) SetInt( const char* Section, const char* KeyName, const int InputValue );
SDK_XFILEINIDLL(int) SetFloat( const char* Section, const char* KeyName,  const float InputValue, const int digits );
SDK_XFILEINIDLL(void) SetDir( char* filename );

#endif //__FILEINIDLL_H__
