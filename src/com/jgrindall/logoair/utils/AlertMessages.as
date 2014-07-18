package com.jgrindall.logoair.utils{
	import mx.controls.Alert;

	public class AlertMessages{
		
		public static const INVALID_FILE_STRUCTURE:String="The file you have selected is invalid or not a logo file";
		
		public static const FAILED_OPEN_BROWSE:String="Failed to find your local files";
		public static const FAILED_TO_BROWSE_SAVE_AS:String="Failed to find your local files";
		
		public static const FAILED_TO_OPEN_FILE:String="Failed to open file";
		public static const FAILED_TO_SAVE:String="File saving failed";
		public static const FAILED_SAVE_AS:String="Failed to save file at that location, please re-try";
		
		public static const INVOKE_ERROR:String="Invalid file";
		
		public static const SAVE_IO_ERROR:String="An error occurred while trying to save";
		public static const SAVE_AS_IO_ERROR:String="An error occurred while trying to save at that location";
		public static const SAVE_IMAGE_IO_ERROR:String="An error occurred while trying to save at that location";
		
		public static const INVALID_FILENAME:String="Please choose a valid .logo filename";
		public static const INVALID_FILE_NAME_SAVE_AS:String="Please choose a valid .logo filename";
		
		public static const FAILED_TO_BROWSE_SAVE_IMAGE:String="Failed to find your local files";
		
		public static const FAILED_SAVE_IMAGE:String="Failed to save image";
		public static const INVALID_FILE_NAME_IMAGE:String="Please choose a valid .jpg file";
			
		
		public static const FAILED_TO_BROWSE_UPLOAD:String="Failed to find your local files";
		
		public static const FAILED_FACEBOOK_ONLINE:String="An error occured while trying to post your comment to Facebook";
		
		public static const PROBLEM_FACEBOOK_ONLINE:String="A problem occured while trying to post your comment to Facebook";
		
		public static const ONLINE_FACEBOOK_SUCCESS:String="Posted to Facebook";
		
		public static const ONLINE_FAILED_OPEN:String="An error occured while trying to open your files";
		public static const ONLINE_PROBLEM_OPEN:String="A problem occured while trying to open your files";
		public static const ONLINE_FAILED_SAVE:String="An error occured while trying to save your file";
		public static const ONLINE_FAILED_SAVE_AS:String="An error occured while trying to save your file with that name ";
		
		public static const SAVE_IMAGE_SUCCESS:String="Your image has been saved";
		public static const SAVE_AS_IMAGE_SUCCESS:String="Your image has been saved";
		
		public static const FACEBOOK_NOT_LOGGEDIN:String="You are not logged in to Facebook";
		public static const FACEBOOK_LOGGEDIN:String="You are logged in to Facebook";
		
		public static const FACEBOOK_LOGGEDOUT:String="You are logged out of Facebook";
		public static const FACEBOOK_OFFLINE_ERROR:String="An error occured posting to Facebook";
		public static const FACEBOOK_OFFLINE_SUCCESS:String="Your image has been uploaded into a photo album called 'Logotacular Photos'";
		
		public static function showAlert(s:String,title:String="Error",flags:int=4):void{
			Alert.show(s,title,flags)
		}
		
	}
}