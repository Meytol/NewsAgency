using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccessLayer.Migrations
{
    public partial class Add_NewsSeenUser_ForeignKey : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_NewsSeens_UserId",
                table: "NewsSeens",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_NewsSeens_Users_UserId",
                table: "NewsSeens",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.NoAction);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_NewsSeens_Users_UserId",
                table: "NewsSeens");

            migrationBuilder.DropIndex(
                name: "IX_NewsSeens_UserId",
                table: "NewsSeens");
        }
    }
}
