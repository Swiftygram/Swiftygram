//
//  CountrySelectionViewController.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/14/19.
//

import UIKit

class CountrySelectionViewController: UIViewController {
    
    private typealias DataSource = (title: String, countries: [CountryInfo])
    
    @IBOutlet private var searchBar: UISearchBar! {
        didSet {
            setupSearchBar()
        }
    }
    
    @IBOutlet private var tableView: UITableView!
    
    @IBOutlet private var separatorHeightConstraint: NSLayoutConstraint! {
        didSet {
            separatorHeightConstraint.constant = 1 / UIScreen.main.scale
        }
    }
    
    private let usesSubtitles = Localizations.Locale.lowercased() != "en"
    private let countries: [CountryInfo]
    private let initialDataSource: [DataSource]
    private var dataSource = [DataSource]()
    private let completion: (CountryInfo) -> ()
    private var cancelButtonObservation: NSKeyValueObservation?
    
    init(countryManager: CountryManager, completion: @escaping (CountryInfo) -> ()) {
        countries = countryManager.allCountries.sorted(by: { $0.displayedName < $1.displayedName })
        initialDataSource = type(of: self).generateInitialDataSource(for: countries)
        dataSource = initialDataSource
        self.completion = completion
        
        super.init(nibName: String(describing: type(of: self)), bundle: .swiftygram)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        
        searchBar.becomeFirstResponder()
    }
    
    private class func generateInitialDataSource(for countries: [CountryInfo]) -> [DataSource] {
        var dict = [String: [CountryInfo]]()
        
        for country in countries {
            let firstLetter = String(country.displayedName.prefix(1))
            
            dict[firstLetter, default: []].append(country)
        }
        
        return dict
            .map({ DataSource(title: $0, countries: $1) })
            .sorted(by: { $0.title < $1.title })
    }
    
    private func updataDataSource(with searchText: String) {
        defer {
            tableView.reloadData()
        }
        
        if searchText.isEmpty {
            dataSource = initialDataSource
            return
        }
        
        let query = searchText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        let result = countries
            .filter({ $0.defaultCountryName.lowercased().hasPrefix(query)
                || $0.localizedCountryName.lowercased().hasPrefix(query) })
        
        dataSource = [("", result)]
    }
    
    private func setupSearchBar() {
        let cancelButtonSelector = "cancelButton"
        
        if searchBar.responds(to: NSSelectorFromString(cancelButtonSelector)),
            let cancelButton = searchBar.value(forKey: cancelButtonSelector) as? UIButton {
            cancelButton.isEnabled = true
            
            cancelButtonObservation = cancelButton.observe(\.isEnabled, changeHandler: { button, _ in
                if !button.isEnabled {
                    button.isEnabled = true
                }
            })
        }
    }
    
    private func finish() {
        searchBar.resignFirstResponder()
        
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UISearchBarDelegate

extension CountrySelectionViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        finish()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updataDataSource(with: searchText)
    }
}

// MARK: - UITableViewDataSource

extension CountrySelectionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = dataSource[indexPath.section].countries[indexPath.row]
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell.textLabel?.text = country.localizedCountryName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource.count == 1 ? nil : dataSource[section].title
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if dataSource.count == 1 {
            return nil
        }
        
        return [UITableView.indexSearch] + dataSource.map({ $0.title })
    }
}

// MARK: - UITableViewDelegate

extension CountrySelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let country = dataSource[indexPath.section].countries[indexPath.row]
        
        completion(country)
        
        finish()
    }
}
