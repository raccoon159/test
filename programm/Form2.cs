using Microsoft.Win32;
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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }        

        private void Form2_Load(object sender, EventArgs e)
        {
            RegistryKey Key1 = Registry.LocalMachine.OpenSubKey(@"HARDWARE\DESCRIPTION\System");//чтение реестра
            string iden = (string)Key1.GetValue("Identifier");
            string sys = (string)Key1.GetValue("SystemBiosDate");
            string vid = (string)Key1.GetValue("VideoBiosDate");
            Key1.Close();
            string key1 = iden + sys + vid;            

            RegistryKey currentUserKey = Registry.CurrentUser;//чтение программы
            RegistryKey Key = currentUserKey.OpenSubKey(@"Software\Programm_reestr\Settings");
            string key2 = Key.GetValue("KEY").ToString();
            Key.Close();

            
            label2.Text=key1;
            label3.Text= key2;

            if(key1 != key2)
            {
                MessageBox.Show("Обратитесь к разработчику программы", "Ошибка");
            }
            else
                MessageBox.Show("Программа работает", "Ура");           
        }
    }
}
