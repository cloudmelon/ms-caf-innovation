import { Component,ViewContainerRef  } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { ApiService } from './api.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
 
  data: any;
  constructor(private toastr: ToastrService, private apiService: ApiService ) {
      this.data = {};
 }
   
  onSubmit(event) {
   
    if (event) event.preventDefault();
  
    var build = {
        name : this.data.name,
        email : this.data.email,
        comment : this.data.comment,
        location : this.data.location,
        lifetime : this.data.lifetime,
        image : this.data.selected,
        requesttime: Date.now()
    };
   
    console.log('build =====>', build);

    this.apiService.goBuild(build)
    .subscribe(res => {
      console.log(res); 
    }, err => {
      console.log(err);
    });

    console.log('passe data ====> ', build);
    
    this.toastr.success('The deployment request has been submitted successfully', 'Success!');
  }


  /**
   * success, error, info, warning take (message, title, ToastConfig)
   * Example :
   * this.toastr.error('everything is broken', 'Major Error', {
     timeOut: 3000
    });
   */
}
