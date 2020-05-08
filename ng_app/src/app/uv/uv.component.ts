import { Component, OnInit, Input } from '@angular/core';
import { WeatherService } from '../_services';

@Component({
  selector: 'app-uv',
  templateUrl: './uv.component.html',
  styleUrls: ['./uv.component.css']
})
export class UvComponent implements OnInit {
  @Input() location : string;
  currentWeather: any = <any>{};
  uv: any[] = [];
  msg: string;
  
  constructor(private weatherService: WeatherService) {}
  
  ngOnInit() {
    this.searchWeather(this.location);
  }
  
  searchWeather(loc: string) {
    this.msg = '';
    this.currentWeather = {};
    this.weatherService.getCurrentWeather(loc)
      .subscribe(res => {
        this.currentWeather = res;
      }, err => {}, () => {
        this.searchUv(loc);
      })
  }
  
  searchUv(loc: string) {
    this.weatherService.getUv(this.currentWeather.coord.lat, this.currentWeather.coord.lon)
      .subscribe(res => {
        this.uv = res as any[];
      }, err => {})
  }
  
  resultFound() {
    return Object.keys(this.currentWeather).length > 0;
  }
}