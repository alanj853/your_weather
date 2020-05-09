import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private configApiUrl;

  constructor(private http: HttpClient) {
    this.configApiUrl = window.location.href;
   }

    getAll() {
        return this.http.get<any[]>(`${this.configApiUrl}/users`);
    }

    register(user) {
        return this.http.post(`${this.configApiUrl}/users/register`, user);
    }

    delete(id) {
        return this.http.delete(`${this.configApiUrl}/users/${id}`);
    }
}
