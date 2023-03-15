//
//  ReminderListViewController.swift
//  Today
//
//  Created by Kübra Cennet Yavaşoğlu on 10.03.2023.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    //Hücrenin içeriği ve görünümünü ayarlarım, hücreleri fark edilebilir veri kaynağına bağlarım.
    //typealias DataSource = UICollectionViewDiffableDataSource<Int, String> // Fark edilebilir veri kaynağı için bir tür adı ekledim.Tür takma adları, daha anlamlı bir adla varolan bir türe başvurmak için yararlıdır.
    //typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String> // fark edilebilir veri kaynağı anlık görüntüsü için tür adı
    
    var dataSource: DataSource!
    var reminders: [Reminder] = Reminder.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout // liste düzenini koleksiyon görünümü düzenini atadım
        
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler) // yeni hücre kaydı.Hücre kaydı, bir hücrenin içeriğinin ve görünümünün nasıl yapılandırılacağını belirtir.
        
            dataSource = DataSource(collectionView: collectionView) {
                (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
           // let reminder = Reminder.sampleData[indexPath.item] //öğeye karşılık gelen hatırlatıcı
           // var contentConfiguration = cell.defaultContentConfiguration() //hücrenin varsayılan içerik yapılandırması alın. defaultContentConfiguration()->önceden tanımlanmış sistem stiliyle içerik yapılandırması oluşturur.
               
            //contentConfiguration.text = reminder.title // liste yapılandırma metnini hücrenin birincil metni olarak görüntüler
            //cell.contentConfiguration = contentConfiguration // içerik yapılandırmasını hücreye atadım
        
        
       // dataSource = DataSource(collectionView: collectionView) {
          //  (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in // yeni veri kaynağı
           // return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier) //hücre kaydını kullanarak hücreyi kuyruktan çıkar ve döndür
            
        }
        
        var snapshot = Snapshot() //anlık görüntü değişkeni
        snapshot.appendSections([0]) //anlık görüntüye eklenen bölümler
        snapshot.appendItems(reminders.map { $0.title })
        dataSource.apply(snapshot)//anlık görüntüyü veri kaynağına uygula
        
        collectionView.dataSource = dataSource // veri kaynağını koleksiyon görünüme ata
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration) //düzeni döndürerek derleyici hatasını yok ederim.
        
    }
    
}
