/**
* 想剪裁图片的那些地方，
* 传入矩形区域就好
* 例如：丢弃图片周围50个像素，即获取图片中间区域：
* cut_frame(pImgOld1, pImgOld2, cvRect(BORDER, BORDER, pImgOld1->width-BORDER*2, pImgOld1->height-BORDER*2));
*/
static void cut_frame(IplImage* img,IplImage* dst, CvRect rcet)
{
	IplImage* src=img;
	int width = src->width;
	int height = src->height;
	cvSetImageROI(src, rcet);
	cvCopy(src,dst,0);
	cvResetImageROI(src);
}