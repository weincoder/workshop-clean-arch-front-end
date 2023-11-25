import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AlbumCardComponent } from './UI/view-models/album-card/album-card.component';
import { CircularProgressIndicatorComponent } from './UI/common/circular-progress-indicator/circular-progress-indicator.component';
import { AlbumApiService } from './infraestructure/driven-adapter/album-api/album-api.service';
import { AlbumGateway } from './domain/models/Album/gateway/album-gateway';
import { HttpClientModule } from '@angular/common/http';
import { AlbumApiServiceWithoutDelay } from './infraestructure/driven-adapter/album-api/album-api-withou-delay.service';

@NgModule({
  declarations: [
    AppComponent,
    AlbumCardComponent,
    CircularProgressIndicatorComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [
    provideClientHydration(),
    { provide: AlbumGateway, useClass: AlbumApiServiceWithoutDelay },
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
