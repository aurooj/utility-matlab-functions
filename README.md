# utility-matlab-functions
This repository contains functions which I wrote to reuse for some basic tasks related to computer vision or can be used in general .

Functions include: 
# imwarp(markerImage, imageToEmbed, H, vector1)
This function warps an image onto another within corner points using the homography matrix H 

INPUT PARAMETERS : frame - image on which another image is to be warped
		   imgToEmbed - image to be warped on frame 									   	   H - Homography matrix 
		   cornerPts - corner points on frame in which warped image will be embed 
								
OUTPUT PARAMETERS: warpedImg - final image after warping 

USAGE: warpedImg=imwarp( markerImage, imageToEmbed, H, vector1);

where vector1 is of meanpoints given in following format: 

vector1= [ meanPoints(1,1) meanPoints(1,2);meanPoints(2,1) meanPoints(2,2); meanPoints(3,1) meanPoints(3,2); meanPoints(4,1) meanPoints(4,2)];


# getIOU(pred_map,gt_map,get_other_scores)

this function computes IOU when given a prediction map and respective ground truth map for an image. Both pred_map and gt_map should be 2D binary maps. IOU is a common performance metric for evaluating results of Semantic Segmentation task.

INPUT: 		 pred_map: a binary image prediction map
%          gt_map: a binay image ground truth map
%          get_other_scores: An optional flag which by default is zero.
%          Returns Precision and Recall scores if set to 1.

OUTPUT: IOU: Intersection over Union score which should be a scalar number between the range [0,1].

# imresizeAll(path/to/src/folder, [nrows ncols], path/to/dest/folder ) 
This function resizes all images in a given folder to the desired size. 
Default format for resized images is 'PNG'. 

USAGE: imresizeAll('/home/aisha/input_images/',[224 224],'/home/aisha/output_images','JPG')

# removeEmptyFields(matfile)

This method removes empty structures from .mat file.

INPUT: struct with empty fields to be removed.

OUTPUT: cleaned struct without any empty rows.

%% example:Input={{[],[]},{a,b},{b,c}}

%% output={{a,b},{b,c}}
