/*
* 计算图片hsv的数值
*
*
*/
static int cal_hsv(IplImage* pImg)
{
	int i=0;
	int j=0;
	double v=0;
	double T1=0.9;
	double T2=0.1;
	int width = pImg->width;
	int height = pImg->height;
	double H_temp=0;
	double S_temp=0;
	double V_temp=0;
	CvScalar scaler;
	CvSize SrcSize = cvSize(width, height);
	IplImage* H_plane  = cvCreateImage(SrcSize, IPL_DEPTH_8U, 1);
	IplImage* S_plane  = cvCreateImage(SrcSize, IPL_DEPTH_8U, 1);
	IplImage* V_plane  = cvCreateImage(SrcSize, IPL_DEPTH_8U, 1);
	IplImage* HSV = cvCreateImage(SrcSize, IPL_DEPTH_8U, 3);
	int value=0;

	cvCvtColor(pImg, HSV, CV_BGR2HSV);
	//printf("亮度%.2f\n",feature.hsv[2]);
	cvCvtPixToPlane(HSV, H_plane, S_plane, V_plane, 0);

	//mean:h,s,v
	for(i=0;i<height;i++)
	{
		for(j=0;j<width;j++)
		{
			// scaler = cvGet2D(H_plane,i,i);
			// H_temp += cvGet2D(H_plane,i,i).val[0];
			// scaler = cvGet2D(S_plane,i,i);
			// S_temp += cvGet2D(S_plane,i,i).val[0];
			scaler = cvGet2D(V_plane,i,i);
			V_temp += cvGet2D(V_plane,i,i).val[0];
		}
	}
	
	//计算并归一化
	// h = H_temp/(height)/(width)/(255);
	// h = S_temp/(height)/(width)/(255);
	v = V_temp/(height)/(width)/(255);
	if (v>T1 || v<T2)
	{
		value = 0;
	}
	else
	{
		value = 1;
	}


	cvReleaseImage(&H_plane);
	cvReleaseImage(&S_plane);
	cvReleaseImage(&V_plane);
	cvReleaseImage(&HSV);
	return value;
}
