using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace programm
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();

            int login = Convert.ToInt16(textBox1.Text);
            int password = Convert.ToInt16(textBox2.Text);

            bool ad = login == 123 && password == 123 ? true : false;
                 
            if (ad == true)
            {
                //this.Visible =false;               
                form2.Show();
            }
            else
            MessageBox.Show("Введите верный пароль или логин", "Ошибка");
        }
    }
}
