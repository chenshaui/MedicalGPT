CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 torchrun --nproc_per_node 8 supervised_finetuning.py \
    --model_name_or_path Qwen/Qwen2.5-0.5B-Instruct \
    --train_file_dir ./data/finetune \
    --validation_file_dir ./data/finetune \
    --cache_dir ./model \
    --device_map None \
    --use_peft False \
    --per_device_train_batch_size 2 \
    --do_train \
    --num_train_epochs 3 \
    --per_device_eval_batch_size 2 \
    --max_train_samples -1 \
    --learning_rate 3e-5 \
    --warmup_ratio 0.2 \
    --model_max_length 2048 \
    --weight_decay 0.01 \
    --logging_strategy steps \
    --logging_steps 1 \
    --save_steps 400 \
    --save_strategy steps \
    --save_total_limit 3 \
    --gradient_accumulation_steps 8 \
    --preprocessing_num_workers 10 \
    --output_dir outputs-full-sft-v1 \
    --overwrite_output_dir \
    --ddp_timeout 30000 \
    --logging_first_step True \
    --target_modules all \
    --torch_dtype bfloat16 \
    --report_to tensorboard \
    --neft_alpha 8 \
    --ddp_find_unused_parameters False \
    --gradient_checkpointing True \
    --template_name chatglm3 \
    --deepspeed ./zero2.json \
    --bf16
