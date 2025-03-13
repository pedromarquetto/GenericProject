CREATE OR ALTER PROCEDURE usp_CreateSystemScreenAndFields  
	@pScreenName NVARCHAR(MAX),  
	@pModelName NVARCHAR(MAX),  
	@pIsContolPage bit  
AS  
BEGIN  
   
	DECLARE 
		@vSSTableId INT, 
		@vErrorMessage NVARCHAR(MAX), 
		@pSystemScreenId INT  
  
	SELECT  
		@vSSTableId = SSTable.SSTableId   
	FROM  
	SSTable   
	WHERE Name = @pModelName  
  
	IF @vSSTableId IS NULl  
	BEGIN  
		SELECT 
			@vErrorMessage = CONCAT('Erro, SSTable para model não existe: ',@pModelName)  
		RAISERROR(@vErrorMessage,16,1)  
		RETURN  
	END  
  
	SELECT  
		TT.name as TypeName,  
		C.name as ColumnName,  
		T.name as TableName  
	INTO #tmpObject  
	FROM
	sys.tables T
	JOIN sys.columns C on T.object_id = C.object_id  
	JOIN sys.types TT on TT.system_type_id = C.system_type_id  
	WHERE TT.name <> 'sysname'  
		AND T.name = @pModelName  
   
	IF EXISTS(SELECT 1 FROM #tmpObject)  
	BEGIN
  
		BEGIN TRANSACTION  
  
		INSERT INTO SystemScreen (Code,Name,MinUserLevel,IsVisible,IsActive,CreateDate,SSTableId,PresentationSequence,IsControlScreen)   
		VALUES(@pScreenName,@pScreenName,1,1,1,GETDATE(),@vSSTableId,(SELECT MAX(PresentationSequence)+1 FROM SystemScreen),@pIsContolPage)  
  
		SELECT TOP 1 @pSystemScreenId = SystemScreen.SystemScreenId FROM SystemScreen ORDER BY CreateDate DESC
  
  
		IF @pSystemScreenId IS NOT NULL AND @pIsContolPage = 0  
		BEGIN
			INSERT INTO SystemScreenField (SystemScreenId,Name,IsActive,CreateDate,Xname,FieldTypeName,IsVisible,IsDisabled,ModelField,ValidationId,ValidationMessage)   
			SELECT  
				@pSystemScreenId,  
				t.ColumnName,  
				1,  
				GETDATE(),  
				CASE   
					WHEN T.TypeName IN ('varchar','nvarchar','numeric','decimal') THEN CONCAT('txt',T.ColumnName)  
					WHEN SUBSTRING(T.ColumnName,1,2) = 'Is' AND T.TypeName = 'INT' THEN CONCAT('ckb',T.ColumnName)
					WHEN SUBSTRING(T.ColumnName,1,2) = 'Is' AND T.TypeName = 'BIT' THEN CONCAT('ckb',T.ColumnName)  
					WHEN T.TypeName = 'INT' THEN CONCAT('txt',T.ColumnName)  
					WHEN T.TypeName = 'datetime' THEN CONCAT('dt',T.ColumnName)  
					WHEN T.TypeName = 'Varbinary' THEN CONCAT('file',T.ColumnName)  
				END,  
				CASE   
					WHEN T.TypeName IN ('varchar','nvarchar','numeric','decimal') THEN 'Entry'  
					WHEN SUBSTRING(T.ColumnName,1,2) = 'Is' AND T.TypeName = 'INT' THEN 'CheckBox'  
					WHEN T.TypeName = 'INT' THEN 'Entry'  
					WHEN T.TypeName = 'datetime' THEN 'DateTimePicker'  
					WHEN T.TypeName = 'Varbinary' THEN 'File'  
				END,  
				1,  
				0,  
				T.ColumnName,  
				1,  
				''  
			FROM  
			#tmpObject t  
     
			--btnSave  
			INSERT INTO SystemScreenField (SystemScreenId,Name,IsActive,CreateDate,Xname,FieldTypeName,IsVisible,IsDisabled,ModelField,ValidationId,ValidationMessage)   
			SELECT  
				@pSystemScreenId,  
				'btnSave',  
				1,  
				GETDATE(),  
				'btnSave',  
				'Button',  
				1,  
				0,  
				'',  
				1,  
				''  
  
  
			COMMIT TRANSACTION  
		END  
		ELSE IF @pSystemScreenId IS NOT NULL AND @pIsContolPage = 1  
		BEGIN  
			INSERT INTO SystemScreenField (SystemScreenId,Name,IsActive,CreateDate,Xname,FieldTypeName,IsVisible,IsDisabled,ModelField,ValidationId,ValidationMessage)   
			SELECT  
			@pSystemScreenId,  
			t.ColumnName,  
			1,  
			GETDATE(),  
			CONCAT('gridCol_',t.ColumnName),  
			'Grid Column',  
			1,  
			0,  
			'',  
			1,  
			''  
			FROM  
			#tmpObject t  
  
			--btnNew  
			INSERT INTO SystemScreenField (SystemScreenId,Name,IsActive,CreateDate,Xname,FieldTypeName,IsVisible,IsDisabled,ModelField,ValidationId,ValidationMessage)   
			SELECT  
				@pSystemScreenId,  
				'btnNew',  
				1,  
				GETDATE(),  
				'btnNew',  
				'Button',  
				1,  
				0,  
				'',  
				1,  
				''  

			--gridCol_ButtonDetail  
			INSERT INTO SystemScreenField (SystemScreenId,Name,IsActive,CreateDate,Xname,FieldTypeName,IsVisible,IsDisabled,ModelField,ValidationId,ValidationMessage)   
			SELECT  
				@pSystemScreenId,  
				'gridCol_ButtonDetail',  
				1,  
				GETDATE(),  
				'gridCol_ButtonDetail',  
				'Grid Column',  
				1,  
				0,  
				'',  
				1,  
				''   
    
			INSERT INTO SystemScreenField (SystemScreenId,Name,IsActive,CreateDate,Xname,FieldTypeName,IsVisible,IsDisabled,ModelField,ValidationId,ValidationMessage)   
			SELECT  
				@pSystemScreenId,  
				'txtSearch',  
				1,  
				GETDATE(),  
				'txtSearch',  
				'Entry',  
				1,  
				0,  
				'',  
				1,  
				''  
  
			UPDATE SystemScreenField SET PRESENTATIONSEQUENCE = RN  
			FROM  
			(  
				SELECT  
					ROW_NUMBER() OVER (ORDER BY CASE WHEN XNAME = 'gridCol_ButtonDetail' THEN 0 ELSE SystemScreenField.SystemScreenId END) AS RN,  
					SystemScreenField.SystemScreenFieldId  
				FROM  
				SystemScreenField  
				WHERE SystemScreenId = @pSystemScreenId  
			) T  
			JOIN SystemScreenField ON SystemScreenField.SystemScreenFieldId = T.SystemScreenFieldID  
  
			COMMIT TRANSACTION  
		END
		ELSE  
		BEGIN  
			ROLLBACK TRANSACTION  
			RAISERROR('Erro na criação de tela',16,1)  
			RETURN  
		END  
    
	END  
END