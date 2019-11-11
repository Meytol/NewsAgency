using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using BusinessLogicLayer.ViewModels.News;
using Common.Enums.Models;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;

namespace BusinessLogicLayer.Services
{
    public class NewsService : GenericRepository<News>, INewsService
    {
        private readonly INewsCategoryService _newsCategoryService;
        private readonly ICategoryService _categoryService;

        public NewsService(DatabaseContext context, INewsCategoryService newsCategoryService, ICategoryService categoryService) : base(context)
        {
            _newsCategoryService = newsCategoryService;
            _categoryService = categoryService;
        }

        public async Task<CategoryNewsMain> GetLastNewsByCategoryIdAsync(int quentity, int categoryId)
        {
            var cateoryIds = _categoryService.FindCategoryChildsByParentId(categoryId);
            
            var newsCategories = await _newsCategoryService.FindBy(newsCategory => cateoryIds.Any(catIds => catIds == newsCategory.CategoryId))
                .Include(newsCategory => newsCategory.Category)
                .Include(newsCategory => newsCategory.News)
                .ThenInclude(news => news.Author)
                .OrderByDescending(newsCategory => newsCategory.CreatedOn)
                .Take(quentity)
                .ToListAsync();

            var categoryNewsSetction = new CategoryNewsMain
            {
                CategoryNewsViewModels = new List<CategoryNewsViewModel>(),
                CategoryId = categoryId,
                CategoryTitle = _categoryService.Get(categoryId).Title
            };

            foreach (var newsCategory in newsCategories)
            {
                var categoryNews = new CategoryNewsViewModel()
                {
                    NewsTitle = newsCategory.News.Title,
                    NewsHeadLine = newsCategory.News.Headline,
                    ImageUrl = newsCategory.News.ImageUrl,
                    CategoryTitle = newsCategory.Category.Title,
                    CategoryId = newsCategory.Category.Id,
                    NewsId = newsCategory.NewsId,
                    CreatedOn = newsCategory.News.CreatedOn,
                    Author = newsCategory.News.Author.FullName,
                    AuthorId = newsCategory.News.AuthorId
                };

                categoryNewsSetction.CategoryNewsViewModels.Add(categoryNews);
            }

            return categoryNewsSetction;

        }
    }
}