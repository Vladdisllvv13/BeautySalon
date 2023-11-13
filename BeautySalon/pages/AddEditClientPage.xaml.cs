using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace BeautySalon.pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditClientPage.xaml
    /// </summary>
    public partial class AddEditClientPage : Page
    {
        Client _currentClient = new Client();
        public AddEditClientPage()
        {
            InitializeComponent();
            if (client != null)
            {
                _currentClient = client;
                LViewTags.ItemsSource = AutoserviceEntities.GetContext().Tag.ToList();
            }
            else { btDeleteClient.IsEnabled = false; }
            DataContext = _currentClient;
            cmbGender.ItemsSource = AutoserviceEntities.GetContext().Gender.ToList();
        }

        private void btnEnterImage_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                OpenFileDialog GetImageDialog = new OpenFileDialog();

                GetImageDialog.Filter = "Файлы изображений: (*.png, *.jpg, *jpeg)| *.png; *.jpg; *jpeg";
                GetImageDialog.InitialDirectory = "C:\\Users\\ostas\\source\\repos\\Autosrevice\\Autosrevice\\images\\Клиенты\\";
                if (GetImageDialog.ShowDialog() == true) _currentClient.PhotoPath = GetImageDialog.SafeFileName;
                imgClient.Source = new BitmapImage(new Uri(GetImageDialog.FileName));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnDeleteImage_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string defaultImagePath = (string)FindResource("defaultImage");
                if (!string.IsNullOrEmpty(defaultImagePath))
                {
                    BitmapImage defaultImage = new BitmapImage(new Uri(defaultImagePath));
                    imgClient.Source = defaultImage;
                }
                _currentClient.PhotoPath = null;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btDeleteClient_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (_currentClient.ClientService.Count > 0)
                {
                    MessageBox.Show("Невозможно удалить, так как у клиента есть информация о посещении", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                    return;
                }
                foreach (Tag tag in _currentClient.Tag)
                {
                    AutoserviceEntities.GetContext().Tag.Remove(tag);
                }
                AutoserviceEntities.GetContext().Client.Remove(_currentClient);
                AutoserviceEntities.GetContext().SaveChanges();
                MessageBox.Show("Удаление информации об клиенте завешено!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btSaveClient_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (cmbGender.SelectedItem == null) errors.AppendLine("Выберите пол клиента!");
                if (tbFirstName.Text.Count() > 30) errors.AppendLine("Фамилия не может быть длиннее 30 символов!");
                if (tbLastName.Text.Count() > 30) errors.AppendLine("Имя не может быть длиннее 30 символов!");
                if (tbPatronymic.Text.Count() > 30) errors.AppendLine("Отчество не может быть длиннее 30 символов!");
                if (tbFirstName.Text == "" || tbLastName.Text == "" || tbPhone.Text == "") errors.AppendLine("Не заполнены обязательные поля!");
                if (!dpBirthday.SelectedDate.HasValue) errors.AppendLine("Не выбрана дата рождения");

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString());
                    return;
                }

                if (!ValidateFIO(tbFirstName.Text)) { MessageBox.Show("Неверно введена Фамилия"); return; };
                if (!ValidateFIO(tbLastName.Text)) { MessageBox.Show("Неверно введено Имя"); return; };
                if (!ValidateFIO(tbPatronymic.Text)) { MessageBox.Show("Неверно введено Отчество"); return; };
                if (!ValidatePhone(tbPhone.Text)) { MessageBox.Show("Неверно введен номер телефона"); return; };
                if (!ValidateEmail(tbEmail.Text)) { MessageBox.Show("Неверно введена почта"); return; };


                _currentClient.Birthday = (DateTime)dpBirthday.SelectedDate;
                _currentClient.GenderCode = (cmbGender.SelectedIndex + 1).ToString();
                if (_currentClient.ID == 0)
                {
                    _currentClient.RegistrationDate = DateTime.Now;
                    AutoserviceEntities.GetContext().Client.Add(_currentClient);
                    AutoserviceEntities.GetContext().SaveChanges();
                    MessageBox.Show("Добавление информации о клиенте завершено");
                    NavigationService.GoBack();
                }
                else
                {
                    AutoserviceEntities.GetContext().Client.Add(_currentClient);
                    AutoserviceEntities.GetContext().SaveChanges();
                    MessageBox.Show("Обновление информации о клиенте завершено");
                    NavigationService.GoBack();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btAddTag_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (_currentClient.ID == 0) { MessageBox.Show("Сначала необходимо добавить клиента"); return; }

                StringBuilder errors = new StringBuilder();
                if (tbTagName.Text == "") errors.AppendLine("Не введено наименование тега");
                if (tbTagColor.Text == "") errors.AppendLine("Не введен цвет тега");
                string color = tbTagColor.Text;

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString());
                    return;
                }

                if (!ValidateColor(tbTagColor.Text))
                {
                    MessageBox.Show("Корректно введите цвет");
                    return;
                }
                if (color.Length != 6) { MessageBox.Show("Количество символов должно быть равно 6"); return; }


                Tag tag = new Tag
                {
                    ID = AutoserviceEntities.GetContext().Tag.Any() ? AutoserviceEntities.GetContext().Tag.Max(t => t.ID) + 1 : 1,
                    Title = tbTagName.Text,
                    Color = tbTagColor.Text
                };
                _currentClient.Tag.Add(tag);
                AutoserviceEntities.GetContext().SaveChanges();
                tbTagName.Text = ""; tbTagColor.Text = "";
                LViewTags.ItemsSource = _currentClient.TagList;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btDeleteTag_Click(object sender, RoutedEventArgs e)
        {
            int count = LViewTags.SelectedItems.Count;
            if (count > 0)
            {
                if (MessageBox.Show($"Вы действительно хотите удалить {count} запись/записей?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
                {
                    try
                    {
                        var selected = LViewTags.SelectedItems.Cast<Tag>().ToArray();
                        foreach (var tags in selected)
                        {
                            AutoserviceEntities.GetContext().Tag.Remove(tags);
                        }
                        AutoserviceEntities.GetContext().SaveChanges();

                        MessageBox.Show("Успешно удалено", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                        LViewTags.ItemsSource = _currentClient.TagList;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else
            {
                MessageBox.Show("Выберите теги для удаления", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }


        private bool ValidatePhone(string s)
        {
            Regex regex = new Regex("[^0-9+() -]+");
            return !regex.IsMatch(s);
        }
        private bool ValidateEmail(string s)
        {
            Regex regex = new Regex(@"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
            return regex.IsMatch(s);
        }
        private bool ValidateFIO(string s)
        {
            Regex regex = new Regex("[^a-zа-я -]+");
            return regex.IsMatch(s);
        }

        private bool ValidateColor(string s)
        {
            Regex regex = new Regex("[^0-9]+");
            return !regex.IsMatch(s);
        }
    }
}
