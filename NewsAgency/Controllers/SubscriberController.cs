using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using DataAccessLayer.Entities;
using Microsoft.AspNetCore.Mvc;
using NewsAgency.Authentication.Controllers;

namespace NewsAgency.Controllers
{
    public class SubscriberController : BaseController
    {
        private readonly ISubscriberService _subscriberService;

        public SubscriberController(ISubscriberService subscriberService)
        {
            _subscriberService = subscriberService;
        }

        [HttpPost]
        public HttpStatusCode Register(string name, string email)
        {
            if (!ModelState.IsValid)
                return HttpStatusCode.BadRequest;

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(email))
                return HttpStatusCode.BadRequest;

            if (!email.Contains('@'))
                return HttpStatusCode.BadRequest;

            try
            {
                var subscriber = new Subscriber()
                {
                    EMail = email.Normalize(),
                    Name = name
                };

                _subscriberService.Add(subscriber, createdById: 0);

                return HttpStatusCode.OK;
            }
            catch (Exception e)
            {
                return HttpStatusCode.InternalServerError;
            }
            
        }
    }
}