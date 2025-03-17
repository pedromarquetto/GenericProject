CREATE PROCEDURE [dbo].[usp_login]   
	@pName NVARCHAR(300) = NULL,  
	@pPassword NVARCHAR(300) = NULL,  
	@pStaySigned BIT = NULL,  
	@pEmail NVARCHAR(300) = NULL  
AS  
BEGIN  
  
	DECLARE @vReturnId INT = 0  
	DECLARE @vReturnJsonValue NVARCHAR(MAX) = ''  
	DECLARE @vErrorMessage NVARCHAR(MAX) = ''  
  
	BEGIN TRY  
   
	SELECT   
		@vReturnJsonValue = (  
			SELECT  
				*  
			FROM  
			Users  
			WHERE Name = @pName AND Password = @pPassword  
			FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER  
		)  
  
	IF(ISNULL(@vReturnJsonValue,'') <> '')  
	BEGIN  
		SET @vReturnId = 1  
		GOTO ErrorHandler  
	END  
  
	END TRY  
	BEGIN CATCH  
    
		SELECT 
			@vReturnId = 0,
			@vErrorMessage = 'Error',
			@vReturnJsonValue = ''  

		GOTO ErrorHandler  
  
	END CATCH  
   
	ErrorHandler:  
		SELECT @vReturnId AS ReturnId,@vErrorMessage AS ErrorMessage,@vReturnJsonValue AS ReturnJsonValue  
END