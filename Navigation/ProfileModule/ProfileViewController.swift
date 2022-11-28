
import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var post = [
        ProfilePost(author: "никнейм автора публикации1", description: "текст публикации1", image: "1", likes: 123, views: 23),
        ProfilePost(author: "никнейм автора публикации2", description: "текст публикации2", image: "1", likes: 123, views: 23),
        ProfilePost(author: "никнейм автора публикации3", description: "текст публикации3", image: "1", likes: 123, views: 23),
        ProfilePost(author: "никнейм автора публикации4", description: "текст публикации4", image: "1", likes: 123, views: 23)
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = UIView() //Хедер таблицы
        tableView.tableFooterView = UIView(frame: .zero) //Футер таблицы (обычно нулевой)
        tableView.rowHeight = UITableView.automaticDimension //высота ячейки автоматического размера в зависимости от контента (По умолчанию это свойство имеет значение automaticDimension)
        tableView.estimatedRowHeight = 44 //примерный расчет высоты ячеек
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView") //регестрируем кастомную ячейку и добовляем индификатор (нужен для переиспользования)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.view.addSubview(self.tableView) //tableView по уровню Constraint view
        
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
    }
    
    //MARK: - DataSource (Источник данных)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.post.count
    } //количество ячеек
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)//обьект для каждой ячейки
        let post = post[indexPath.row]
        //   cell.configure(post: post)
        return cell
    }
    
    private func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as? ProfileHeaderView
            return  headerView
        }
        return nil
    }
    
    
    //MARK: - Delegate (позволяют делегату управлять выборами, конфигурировать заголовки раздела и нижние колонтитулы, помогать удалить и переупорядочить ячейки и выполнить другие действия.)
    
    
    
}

