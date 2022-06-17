﻿namespace MyMDb.Shared.DTOs
{
    public class RatingResponse
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int UserId { get; set; }
        public int Score { get; set; }

        public MovieResponse Movie { get; set; }
        //public UserResponse User { get; set; }
    }
}
