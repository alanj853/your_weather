import { Component, OnInit } from '@angular/core';
import { Store, select } from '@ngrx/store';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-web-home-page',
  templateUrl: './web-home-page.component.html',
  styleUrls: ['./web-home-page.component.css']
})
export class WebHomePageComponent implements OnInit {
  loc$: Observable<string>;
  loc: string;  constructor(private store: Store<any>) {
    this.loc$ = store.pipe(select('loc'));
    this.loc$.subscribe(loc => {
      this.loc = loc;
    })
  }  ngOnInit() {
  }}
