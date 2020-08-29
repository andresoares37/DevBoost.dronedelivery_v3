﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DevBoost.dronedelivery.DTO;
using DevBoost.dronedelivery.Models;
using DevBoost.dronedelivery.Service;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace DevBoost.dronedelivery.Controllers
{
    [ApiController]
    public class OAuthController : ControllerBase
    {
        private readonly IUserService _userService;

        public OAuthController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost]
        [Route("login")]
        public IActionResult Authenticate([FromBody] UserDTO model)
        {
            var user = _userService.Authenticate(model.UserName, model.Password);

            if (user == null)
                return NotFound(new { message = "Usuário ou senha inválidos" });

            return Ok(TokenService.GenerateToken(user));
        }
    }
}
