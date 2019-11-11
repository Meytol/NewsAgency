using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using BusinessLogicLayer.ViewModels.HotNews;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;
using Microsoft.EntityFrameworkCore;

namespace BusinessLogicLayer.Services
{
    public class HotNewsService : GenericRepository<HotNews>, IHotNewsService
    {
        private readonly INewsCategoryService _newsCategoryService;

        public HotNewsService(DatabaseContext context, INewsCategoryService newsCategoryService)
        :base(context)
        {
            _newsCategoryService = newsCategoryService;
        }

        public IEnumerable<HotNews> GetLastHotNewses(int quentity = 6)
        {
            return GetAllIncluding(ht => ht.News)
                .OrderByDescending(n => n.UpdatedBy)
                .Take(quentity)
                .ToList();
        }

        public async Task<IEnumerable<HotNews>> GetLastHotNewsesAsync(int quentity = 6)
        {
            return await GetAllIncluding(ht => ht.News)
                .OrderByDescending(n => n.UpdatedBy)
                .Take(quentity)
                .ToListAsync();
        }

        public async Task<IEnumerable<HotNewsHeader>> GetLastHotNewsHeaderAsync(int quentity = 6)
        {
            var hotNewses = await GetLastHotNewsesAsync(quentity);

            return hotNewses.Select(hotNews => new HotNewsHeader()
                {
                    Id = hotNews.Id,
                    NewsId = hotNews.NewsId,
                    NewsTitle = hotNews.News.Title,
                    NewsHeadline = hotNews.News.Headline,
                    CreatedOn = hotNews.News.CreatedOn,
                    Href = ""
                })
                .ToList();
        }

        public async Task<IEnumerable<HotNewsTile>> GetLastHotNewsTileAsync(int quentity = 6)
        {
            var hotNewses = await GetLastHotNewsesAsync(quentity);
            var hotNewsTiles = new List<HotNewsTile>();
            
            foreach (var hotNews in hotNewses)
            {
                var newsMainCategory = _newsCategoryService
                    .GetAllIncluding(n => n.Category)
                    .Where(nc => nc.NewsId == hotNews.NewsId && nc.IsMain == true)
                    .ToList()
                    .FirstOrDefault();

                var hotNewsTile = new HotNewsTile
                {
                    Id = hotNews.Id,
                    NewsId = hotNews.NewsId,
                    NewsTitle = hotNews.News.Title,
                    NewsHeadline = hotNews.News.Headline,
                    CreatedOn = hotNews.News.CreatedOn,
                    ImageUrl = hotNews.News.ImageUrl,
                    CategoryTitle = newsMainCategory.Category.Title, 
                    CategoryId = newsMainCategory.CategoryId,
                };
                hotNewsTiles.Add(hotNewsTile);
            }

            return hotNewsTiles;
        }
    }
}