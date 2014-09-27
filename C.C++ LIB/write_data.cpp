
void write_data(CString name,int* data)
{

	FILE *fout = fopen("..\\_bin\\data.dat","a+"); 
	int i=0;

	fprintf(fout,"%s\t",name);
	while(i<NUM)
	{
		fprintf(fout,"%d:%d\t",i,*(data+i));
		i++;
	}
	fprintf(fout,"\n");
	fclose(fout);
}