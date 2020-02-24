import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpClient } from '@angular/common/http';

//http://jsonplaceholder.typicode.com/users/
class Portfolio {
  id: number;
  itemName: string;
}

class Valuestream {
  id: number;
  itemName: string;
}

class App {
  id: number;
  itemName: string;
}
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent implements OnInit {

  //title = 'lee';

  service_url = "http://localhost:8080/api/app";

  parentList: any[] = [];

  portfolioList: Portfolio[] = [];
  valuestreamList: Valuestream[] = [];
  appList: App[] = [];

  selectedPortfolio = [];
  selectedValuestream = [];
  selectedApp = [];

  dropdownList = [];
  portfolioDropdownSettings = {};
  valuestreamDropdownSettings = {};
  appDropdownSettings = {};

  constructor(private httpClient: HttpClient) {
    this.selectedPortfolio = [];
    this.selectedValuestream = [];
    this.appList = [];
    //console.log("constructor..");
  }

  ngOnInit(): void {

    this.httpClient.get<any[]>(this.service_url).subscribe((res) => {
      //console.log(res);
      this.parentList = res;
      this.buildPortfolioList();
      this.buildValuestreamList();
      this.buildAppList();
    });

    this.portfolioDropdownSettings = {
      singleSelection: false,
      text: "Select Portfolio",
      selectAllText: 'Select All',
      unSelectAllText: 'UnSelect All',
      enableSearchFilter: true,
      classes: "myclass custom-class",
      badgeShowLimit: 1,
    };

    this.valuestreamDropdownSettings = {
      singleSelection: false,
      text: "Select Valuestream",
      selectAllText: 'Select All',
      unSelectAllText: 'UnSelect All',
      enableSearchFilter: true,
      classes: "myclass custom-class",
      badgeShowLimit: 1,
    };

    this.appDropdownSettings = {
      singleSelection: false,
      text: "Select Application",
      selectAllText: 'Select All',
      unSelectAllText: 'UnSelect All',
      enableSearchFilter: true,
      classes: "myclass custom-class",
      badgeShowLimit: 1,
    };

  }

  onItemSelect(item: any) {
  }
  OnItemDeSelect(item: any) {
  }
  onSelectAll(items: any) {
  }
  onDeSelectAll(items: any) {
  }
  OnOpen(items: any) {
    /* this.valuestreamList=[];
    console.log("SelectedPortfolio Length:" + this.selectedPortfolio.length);
    if (this.selectedPortfolio.length == 0) {
      this.buildValuestreamList();
    } else {
      for (var j = 0; j < this.parentList.length; j++) {
        for (var i = 0; i < this.selectedPortfolio.length; i++) {
          if (this.parentList[j].Portfolio_ID === this.selectedPortfolio[i].id) {
            console.log("test");
            let obj = new Valuestream();
            obj.id = this.parentList[j].ValueStream_ID;
            obj.itemName = this.parentList[j].ValueStream_Name;
            var index = this.valuestreamList.findIndex(item => item.id === this.parentList[i].ValueStream_ID);
            console.log(index);
            if (index === -1) {
              this.valuestreamList.push(obj);
            }
          }
        }
      }
    }
    console.log("SelectedPortfolio Length:" + this.selectedPortfolio.length); */
  }

  buildPortfolioList() {
    for (var i = 0; i < this.parentList.length; i++) {
      let obj = new Portfolio();
      obj.id = this.parentList[i].Portfolio_ID;
      obj.itemName = this.parentList[i].Portfolio_Name;
      var index = this.portfolioList.findIndex(item => item.id === this.parentList[i].Portfolio_ID);
      if (index === -1) {
        this.portfolioList.push(obj);
      }
    }
  }

  buildValuestreamList() {
    for (var i = 0; i < this.parentList.length; i++) {
      let obj = new Valuestream();
      obj.id = this.parentList[i].ValueStream_ID;
      obj.itemName = this.parentList[i].ValueStream_Name;
      var index = this.valuestreamList.findIndex(item => item.id === this.parentList[i].ValueStream_ID);
      if (index === -1) {
        this.valuestreamList.push(obj);
      }
    }
    console.log(this.valuestreamList);
  }

  buildAppList() {
    for (var i = 0; i < this.parentList.length; i++) {
      let obj = new App();
      obj.id = this.parentList[i].CI_Application_ID;
      obj.itemName = this.parentList[i].CI_Application_Name;
      var index = this.appList.findIndex(item => item.id === this.parentList[i].CI_Application_ID);
      if (index === -1) {
        this.appList.push(obj);
      }
    }
  }

  selectValuestreamByPortfolioID() {

  }


}
