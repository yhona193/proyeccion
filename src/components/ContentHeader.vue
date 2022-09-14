<template>
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 v-if="title">
                    <i :class="icon" v-if="icon"></i>
                    {{ title }}
                    </h5>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default{
    props:{
        title: {
            type: String,
            default : null,
        },
        icon :{
            type: String,
            default: null,
        }
    },
    beforeMount(){
        let title = this.$store.state.app.name;
        title = this.title ? `${this.title} │ ${title}`  : title;
        $('title').html(title);

    }

}
</script>