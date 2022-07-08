using BusinessLayer.Interface;
using DatabaseLayer;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace FundoNote.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : ControllerBase
    {
        IUserBL userBL;
        public UserController(IUserBL userBL)
        {
            this.userBL = userBL;
        }
        [HttpPost("Register")]
        public IActionResult AddUser(UsersModel users)
        {
            try
            {
                this.userBL.AddUser(users);
                return Ok(new {success = true,Message = "User Registration Sucessfull"});

            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        [HttpGet("GetAllUsers")]
        public IActionResult GetAllUsers()
        {
            try
            {
                List<UserResponseModel> users = new List<UserResponseModel>();
                users = this.userBL.GetAllUsers();
                return Ok(new {success = true ,Message = "All Users fetch successfully",data = users});
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [HttpPost("Login")]
        public IActionResult LoginUser(LoginUserModel user)
        {
            try
            {
                string result = this.userBL.LoginUser(user);
                return Ok(new { success = true, Message = "Token Generated successfully", data = result });

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [HttpPost("ForgetPasswordUser")]
        public IActionResult ForgetPasswordUser(string email)
        {
            try
            {
                bool result = this.userBL.ForgetPasswordUser(email);
                return Ok(new { success = true, Message = "Reset Password Link Send successfully", data = result });

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
