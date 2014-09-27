/*
	用的时候查一下语法格式
	补充一下shutdown的用法
*
**/
void shutdown()
{
	char cmd[255]={0};
	
	sprintf(cmd,"shutdown -s -t 10");
	system(cmd);
}