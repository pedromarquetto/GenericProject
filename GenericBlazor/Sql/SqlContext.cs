using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace GenericBlazor.SqlContext
{

	public class SqlContext
	{
		private readonly IConfiguration _configuration;
		private readonly string _conn = "";
		private readonly SqlConnection _connection;
		public SqlContext(IConfiguration configuration)
		{
			_configuration = configuration;
			_conn = _configuration.GetConnectionString("DbConnection")!;
			_connection = OpenConnection();
		}

		#region SelectMethod
		public string GetTable(string table)
		{
			var result = "";
			var SqlCommand = $"select * from {table} for json auto";
			var cmd = new SqlCommand(SqlCommand, _connection);
			using (var reader = cmd.ExecuteReader())
			{
				while (reader.Read())
				{
					if (reader.HasRows)
					{
						result = result + reader.GetString(0);
					}
				}
			}
			return result.ToString();
		}

		public string GetTableById(string table,int id)
		{
			var result = "";
			var SqlCommand = $"select * from {table} where {table}Id = '{id}' for json auto, WITHOUT_ARRAY_WRAPPER";
			var cmd = new SqlCommand(SqlCommand, _connection);
			using (var reader = cmd.ExecuteReader())
			{
				while (reader.Read())
				{
					if (reader.HasRows)
					{
						result = result + reader.GetString(0);
					}
				}
			}
			return result.ToString();
		}

		public string GetTableByName(string table, string name)
		{
			var result = "";
			var condition = table == "SystemScreen" ? "code" : "name";
			var SqlCommand = $"select * from {table} where {condition} = '{name}' for json auto,WITHOUT_ARRAY_WRAPPER";//WITHOUT_ARRAY_WRAPPER defines that it is not a LIST
			var cmd = new SqlCommand(SqlCommand, _connection);
			using (var reader = cmd.ExecuteReader())
			{
				while (reader.Read())
				{
					if (reader.HasRows)
					{
						result = result + reader.GetString(0);
					}
				}
			}
			return result.ToString();
		}
		public string GetTableByParentId(string table,string parenttable, int id)
		{
			var result = "";
			var SqlCommand = $"select {parenttable}.* from {table} (NOLOCK) join {parenttable} (NOLOCK) ON {parenttable}.{table}id = {table}.{table}id " +
				$"where {table}.{table}id = '{id}' for json auto";
			var cmd = new SqlCommand(SqlCommand, _connection);
			using (var reader = cmd.ExecuteReader())
			{
				while (reader.Read())
				{
					if (reader.HasRows)
					{
						result = result + reader.GetString(0);
					}
				}
			}
			return result.ToString();
		}
		public string GetTableWithChild(string table, string parenttable)
		{
			var result = "";
			var SqlCommand = $"select * from {table} (NOLOCK) join {parenttable} (NOLOCK) ON {parenttable}.{table}id = {table}.{table}id " +
				$"for json auto";
			var cmd = new SqlCommand(SqlCommand, _connection);
			using (var reader = cmd.ExecuteReader())
			{
				while (reader.Read())
				{
					if (reader.HasRows)
					{
						result = result + reader.GetString(0);
					}
				}
			}
			return result.ToString();
		}

		public Tuple<int,string?> GetJsonDataFromProcedure(string procedure, string? parameters = "")
		{
			var returnId = 0;
			var returnJsonValue = "";
			var errorMessage = "";

			var SqlCommand = $"exec {procedure} {parameters}";
			var cmd = new SqlCommand(SqlCommand, _connection);
			try
			{
				using (var reader = cmd.ExecuteReader())
				{
					while (reader.Read())
					{
						if (reader.HasRows)
						{
							returnId = Convert.ToInt32(reader["ReturnId"]);
							errorMessage = reader["ErrorMessage"].ToString();
							returnJsonValue = reader["ReturnJsonValue"].ToString();
						}
					}
				}
				return Tuple.Create(returnId, returnId  == 1 ? returnJsonValue : errorMessage);
			}
			catch (Exception e)
			{
				return Tuple.Create(returnId, e.ToString());
			}
			
		}

		#endregion

		#region InsertMethod

		public string CustomInsertQuery(string query, SqlParameter[] parameters = null)
		{
			var result = "";
			var cmd = new SqlCommand(query, _connection);
			cmd.Parameters.AddRange(parameters);
			try
			{
				result = cmd.ExecuteNonQuery().ToString();
			}
			catch (Exception e)
			{
				result = e.Message;
			}
			return result.ToString();

		}

		#endregion

		#region UpdateMethod



		#endregion

		#region DeleteMethod



		#endregion

		#region Helper

		public SqlConnection OpenConnection()
		{
			var cn = new SqlConnection(_conn);
			try
			{
				cn.Open();
				return cn;
			}
			catch (Exception e)
			{
				return null;
			}
			
		}

		#endregion
	}
}