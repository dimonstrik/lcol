using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lcol.Models
{
    public class Building
    {
        public int Id { get; set; }
        public string Name{ get; set; }
    }

    public class Apartment
    {
        public int Id { get; set; }
        public int Number { get; set; }
        public int Floor { get; set; }

        public int BuildingRefId { get; set; }
        public int OwnerRefId { get; set; }

        [ForeignKey("OwnerRefId")]
        public Owner Owner { get; set; }
        [ForeignKey("BuildingRefId")]
        public Building Building { get; set; }
    }

    public class Owner
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public ICollection<Apartment> Apartments { get; set; }
        public ICollection<Building> Buildings { get; set; }
    }
}
