import { Injectable } from '@angular/core';
import { Observable, of, throwError } from 'rxjs';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { catchError, tap, map } from 'rxjs/operators';

const httpOptions = {
  headers: new HttpHeaders({'Content-Type': 'application/json'})
};

const apiUrl = "https://prod-41.westeurope.logic.azure.com:443/workflows/cb68bfbaa74d4e41ab744d7fdabeecc0/triggers/manual/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=jpeiDqgkihoqetaSeO48lf2GJKHVK1TmTQuu7Yq8kmk";


export class Build {
  name : string;
  email : string;
  comment : string;
  image : string;
}

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  constructor(private http: HttpClient) { }

  private handleError<T> (operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
  
      // TODO: send the error to remote logging infrastructure
      console.error(error); // log to console instead
  
      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
  }

  goBuild (build): Observable<Build> {
    return this.http.post<Build>(apiUrl, build, httpOptions).pipe(
      tap((build: Build) => console.log(`go build`)),
      catchError(this.handleError<Build>('goBuild'))
    );
  }

}
