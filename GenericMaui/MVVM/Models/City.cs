using SQLite;

namespace GenericMaui.MVVM.Models
{
    public class City
    {
        [PrimaryKey,AutoIncrement]
        public int Id { get; set; }
        public int CityId { get; set; }
        public int StateId { get; set; }
        public string Name { get; set; }
        public int IsActive { get; set; }
        public DateTime CreateDate { get; set; }

    }
}
