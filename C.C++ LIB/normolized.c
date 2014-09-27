/*
* ¹éÒ»»¯º¯Êý
*/

static void normalize(double *arr,int M,double max)
{
	int i=0;
	for (i=0;i<M;i++)
	{
		*(arr+i) /= max;
	}
}