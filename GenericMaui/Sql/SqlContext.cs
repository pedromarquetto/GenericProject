
using CommunityToolkit.Mvvm.Input;
using GenericMaui.MVVM.Models;
using Microsoft.Data.Sqlite;
using Microsoft.TeamFoundation.SourceControl.WebApi;
using SQLite;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Sql
{

    public class SqlContext
    {
        readonly SQLiteConnection _database;
        string dbPath = Path.Combine(FileSystem.AppDataDirectory, "Sqlite2.db");
        public SqlContext()
        {
            _database = new SQLiteConnection(dbPath);
            _database.CreateTable<City>();
            _database.CreateTable<Company>();
            _database.CreateTable<CompanyArchive>();
            _database.CreateTable<CompanyConfiguration>();
            _database.CreateTable<CompanyTypes>();
            _database.CreateTable<Country>();
            _database.CreateTable<Item>();
            _database.CreateTable<ItemArchive>();
            _database.CreateTable<ItemCategory>();
            _database.CreateTable<ItemPromotion>();
            _database.CreateTable<ItemType>();
            _database.CreateTable<NbHood>();
            _database.CreateTable<State>();
            _database.CreateTable<SystemScreen>();
            _database.CreateTable<SystemScreenField>();
            _database.CreateTable<Users>();
            _database.CreateTable<UserType>();
            _database.CreateTable<Validation>();
        }

        public int Insert<T>(T item)
        {
            return _database.Insert(item);
        }
        public ObservableCollection<T> Get<T>(T item,string? column = null, string? value = null) 
            where T : new()
        {
            var query = $"SELECT * FROM {item.GetType().Name} WHERE {column ?? "'1'"} = '{value ?? "1"}'";
            //return new ObservableCollection<T>(_database.Query<T>(query).ToList());

            switch (item)
            {
                case City:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<City>(query));
                case Company:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<Company>(query));
                case CompanyConfiguration:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<CompanyConfiguration>(query));
                case CompanyArchive:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<CompanyArchive>(query));
                case CompanyTypes:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<CompanyTypes>(query));
                case Country:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<Country>(query));
                case Item:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<Item>(query));
                case ItemArchive:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<ItemArchive>(query));
                case ItemCategory:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<ItemCategory>(query));
                case ItemPromotion:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<ItemPromotion>(query));
                case ItemType:
                    return new ObservableCollection<T>((IEnumerable<T>) _database.Query<ItemType>(query));
                case NbHood:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<NbHood>(query));
                case State:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<State>(query));
                case SystemScreen:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<SystemScreen>(query));
                case SystemScreenField:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<SystemScreenField>(query));
                case Users:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<Users>(query));
                case UserType:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<UserType>(query));
                case Validation:
                    return new ObservableCollection<T>((IEnumerable<T>)_database.Query<Validation>(query));

                default:
                    throw new NotImplementedException();

            }
        }
        public int Update<T>(T item)
        {
            return _database.Update(item);
        }

        public int Delete<T>(T item)
        {
            var Id = item.GetType().GetProperty("Id");
            var IdValue = Id.GetValue(item);

            switch (item)
            {
                case City:
                    return _database.Delete<City>(IdValue);
                case Company:
                    return _database.Delete<Company>(IdValue);
                case CompanyConfiguration:
                    return _database.Delete<CompanyConfiguration>(IdValue);
                case CompanyTypes:
                    return _database.Delete<CompanyTypes>(IdValue);
                case Country:
                    return _database.Delete<Country>(IdValue);
                case Item:
                    return _database.Delete<Item>(IdValue);
                case ItemArchive:
                    return _database.Delete<ItemArchive>(IdValue);
                case ItemCategory:
                    return _database.Delete<ItemCategory>(IdValue);
                case ItemPromotion:
                    return _database.Delete<ItemPromotion>(IdValue);
                case ItemType:
                    return _database.Delete<ItemType>(IdValue);
                case NbHood:
                    return _database.Delete<NbHood>(IdValue);
                case State:
                    return _database.Delete<State>(IdValue);
                case SystemScreen:
                    return _database.Delete<SystemScreen>(IdValue);
                case SystemScreenField:
                    return _database.Delete<SystemScreenField>(IdValue);
                case Users:
                    return _database.Delete<Users>(IdValue);
                case UserType:
                    return _database.Delete<UserType>(IdValue);

                default:
                    return 0;
            }
        }
    }
}
