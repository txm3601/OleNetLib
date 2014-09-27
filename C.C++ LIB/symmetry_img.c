/**
* 用递归写的
* 用法如下：
*	symmetry_img(pImgGray,2);
*/

static IplImage*  symmetry_img(IplImage* pImg, int loop)
{
	int T=10;
	int X=0;
	int i=0;
	int j=0;
	IplImage* I=pImg;
	IplImage* IL;
	IplImage* IR;
	IplImage* IRf;
	IplImage* pMask;
	IplImage* maskImg;
	IplImage* temp;
	CvSize size;
	CvScalar scale={0};
	CvScalar scaler;
	double value1,value2;
	int width = cvGetSize(pImg).width;
	int height = cvGetSize(pImg).height;
	int rect_width=width/2;
	int rect_height=height;

	if (loop == 0)
	{
		return pImg;
	}
	else
	{
		X = (int)width/2;

		cvSetImageROI(I,cvRect(0, 0, rect_width, rect_height));
		IL = cvCreateImage(cvSize( rect_width, rect_height), IPL_DEPTH_8U, pImg->nChannels);
		cvCopy(I, IL, 0);
		cvResetImageROI(I);

		cvSetImageROI(I,cvRect(X, 0, rect_width, rect_height));
		IR = cvCreateImage(cvSize(rect_width, rect_height), IPL_DEPTH_8U, pImg->nChannels);
		cvCopy(I, IR, 0);
		cvResetImageROI(I);	

		IL = symmetry_img(IL,loop-1);
		IR = symmetry_img(IR,loop-1);

		IRf = cvCreateImage(cvGetSize(IR), IPL_DEPTH_8U, IR->nChannels);
		cvFlip(IR,IRf,1);
		for (i=0;i<IR->height;i++)
		{
			for(j=0;j<IR->width;j++)
			{
				value1 = cvGet2D(IL, i,j).val[0];
				value2 = cvGet2D(IRf,i,j).val[0];
				if (abs(value1-value2)>T)
				{
					cvSet2D(IL,  i, j,cvScalar(0,0,0,0));
					cvSet2D(IRf, i, j,cvScalar(0,0,0,0));
				}	
			}
		}

		cvSetImageROI(I,cvRect(0, 0, rect_width, rect_height));
		cvCopy(IL, I, NULL);
		cvResetImageROI(I);

		cvSetImageROI(I,cvRect(X, 0, rect_width, rect_height));
		cvFlip(IRf, IR, 1);
		cvCopy(IR, I, 0);
		cvResetImageROI(I);	
		
		cvReleaseImage(&IL);
		cvReleaseImage(&IR);
		cvReleaseImage(&IRf);
		return I;
	}
}


/**
* 用非递归写的
* 用法如下：
*	CvRect rect1,rect2,rect;
*
*	rect1 = cvRect(0,0,width/2,height);
*	rect2 = cvRect(width/2, 0, width/2, height);
*	rect  = cvRect(0,0,width,height);
*	symmetry_img(pImgGray,rect1);
*	symmetry_img(pImgGray,rect2);
*	symmetry_img(pImgGray,rect);
*	imgsym = pImgGray;

*/
static void symmetry_img(IplImage* src, CvRect rect)
{
	int X=0;
	int row=0;
	int col=0;
	int x1,y1,x2,y2;
	int T=10;
	double value1,value2;
	int width = rect.width;
	int height= rect.height;
	X = (int)width/2;
	
	for (row=0; row<height; row++)
	{
		if (width%2 == 0)
		{
			for(col=0; col<width/2; col++)
			{
				x1 = col;
				y1 = row;
				x2 = src->width-x1-1;
				y2 = row;
				value1 = cvGet2D(src, y1,x1).val[0];
				value2 = cvGet2D(src, y2,x2).val[0];
				if (abs(value1-value2)>T)
				{
					cvSet2D(src, y1,x1,cvScalar(0,0,0,0));
					cvSet2D(src, y2,x2,cvScalar(0,0,0,0));
				}	
			}
		}
		if (width%2 != 0)
		{
			for(col=0; col<width/2+1; col++)
			{
				x1 = col;
				y1 = row;
				x2 = src->width-x1-1;
				y2 = row;
				value1 = cvGet2D(src, y1,x1).val[0];
				value2 = cvGet2D(src, y2,x2).val[0];
				if (abs(value1-value2)>T)
				{
					cvSet2D(src, y1,x1,cvScalar(0,0,0,0));
					cvSet2D(src, y2,x2,cvScalar(0,0,0,0));
				}	
			}
		}
	}
}
